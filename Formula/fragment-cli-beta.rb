require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4073.0.0-darwin-x64.tar.gz"
    sha256 "5c3d57c7b5b9f68e3a8693606696906fea61001a85019ac97712db3464fca985"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4073.0.0-darwin-arm64.tar.gz"
      sha256 "c8b1ba7843b727aaf0910018cd469fbd8bc59d88f34c4ba2515a4b709574c20a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4073.0.0-linux-x64.tar.gz"
    sha256 "3e588531fc19229bf30cba6540b2f2ff3e61aaef2ecb77d29095eb09853532f2"
  end
  version "4073.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
