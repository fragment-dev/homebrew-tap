require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2963.0.0-darwin-x64.tar.gz"
    sha256 "0076e5b34f6ed5b23419a16e37e8b97f8109557b0df0ca124978a00a7b50c112"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2963.0.0-darwin-arm64.tar.gz"
      sha256 "f2ae2dcbb7b8e169920a10123a6a77304e83297f0e4e3df5a1e23665ec6c12f4"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2963.0.0-linux-x64.tar.gz"
    sha256 "d0ab53db6b2f6aaa74fbbb18713a137380435d287325c84dacd3014869881f1d"
  end
  version "2963.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
