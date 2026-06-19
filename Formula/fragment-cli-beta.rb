require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8737.0.0-darwin-x64.tar.gz"
    sha256 "6b1abfca75d8d373a45adfc11b08a585c4d7b0423c2a77c2a328fdbd1e1a90ca"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8737.0.0-darwin-arm64.tar.gz"
      sha256 "35c33f599e32419f7d8afe3d85dfab561d28e43e0b6dad31acd1eb383b6dc7ad"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8737.0.0-linux-x64.tar.gz"
    sha256 "f0f2a8634c057bfedf608e81b64fbc996ed8772a6a98d76fb4f386b095cadb35"
  end
  version "8737.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    # The tarball ships without a Node runtime; point the launcher's
    # $DIR/node lookup at Homebrew's keg-only node@20.
    rm_f libexec/"bin/node"
    (libexec/"bin").install_symlink Formula["node@20"].opt_bin/"node" => "node"
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
