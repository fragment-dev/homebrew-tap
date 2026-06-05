require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.6.4-9-darwin-x64.tar.gz"
    sha256 "fd0ccd0913a41b654b439db03977cde603afcea12ace26327a219c1598477a66"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.6.4-9-darwin-arm64.tar.gz"
      sha256 "53150a856bc7e67eb179ae4d2a12880a860e1c6a4c05e5507d290d079aac9d43"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.6.4-9-linux-x64.tar.gz"
    sha256 "3bd18a9645a12217da10971ede52dba77830b0fe0c7549e0a8541e72927ad5f0"
  end
  version "2026.6.4-9"
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
