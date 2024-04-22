require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4931.0.0-darwin-x64.tar.gz"
    sha256 "89a7ccf90327b73afc0bec5000657b0f6b716e13c338648b0595cfebdc6b2e40"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4931.0.0-darwin-arm64.tar.gz"
      sha256 "574cb904bc5c400984c256f8d6c59a58bfda2055185c9ec0c2010a8a958f6219"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4931.0.0-linux-x64.tar.gz"
    sha256 "962bddb945ca6e2f8084755d45250d639e71278a4c17b9f481d92bdbd9ed3e4e"
  end
  version "4931.0.0"
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
