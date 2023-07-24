require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3151.0.0-darwin-x64.tar.gz"
    sha256 "b2b630f5d6c56e0e3d7dd0afca25cff729c06ec92da5390ae81e6b04615ce791"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3151.0.0-darwin-arm64.tar.gz"
      sha256 "10392d89bdfd29642596b35f73637f84f350e946cd9f8e1456944d43efb98508"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3151.0.0-linux-x64.tar.gz"
    sha256 "d0a502e54277da934cac963c3de4e926127aca7ed8672261e94e40d7fcfe6f78"
  end
  version "3151.0.0"
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
