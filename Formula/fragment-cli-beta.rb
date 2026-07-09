require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8870.0.0-darwin-x64.tar.gz"
    sha256 "7714d45845a5b379a5c57d3eb02602e6d31974289a5e6d1ce026ffc6e1cdf937"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8870.0.0-darwin-arm64.tar.gz"
      sha256 "966424d395ced9628f427cedd616c4cea1f8f1935a21a5130c7f590be124ab56"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v8870.0.0-linux-x64.tar.gz"
    sha256 "90f2724f26f0677fe935b4c0291cce23b743762a9b8ef756aa75957630ec0667"
  end
  version "8870.0.0"
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
