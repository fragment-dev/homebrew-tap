require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.9.5-darwin-x64.tar.gz"
    sha256 "5823d67331bf7dc61e5bad4ef121c4256c7d85d67eb30439bf6a63a876bd572d"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.9.5-darwin-arm64.tar.gz"
      sha256 "82963d396c105e09aff6dd554d4cb287e3ef4f619b02a7a5f90ca5afe64e29c9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2026.9.5-linux-x64.tar.gz"
    sha256 "23c958f284668349aea559667907d7285875803301fba766d70519e6fd0dac77"
  end
  version "2026.9.5"
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
