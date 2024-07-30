require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5452.0.0-darwin-x64.tar.gz"
    sha256 "518764e57a07cb69f5a707549da3d2008ba2efec6e593184169dac613abcc4b3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5452.0.0-darwin-arm64.tar.gz"
      sha256 "fd56d34cf400380e1e596e4896439c7216bbe8b178b27090e2fb6e0019575d90"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5452.0.0-linux-x64.tar.gz"
    sha256 "85f14fbba684b4b74b0b911000565842405d1a3c9800b4748a526855f7bad1dd"
  end
  version "5452.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
