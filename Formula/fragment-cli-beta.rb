require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4976.0.0-darwin-x64.tar.gz"
    sha256 "54dc9c6075b6c2e7fa81e91b2a6ed0861b422284c835fcb324c460bafb281f7a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4976.0.0-darwin-arm64.tar.gz"
      sha256 "d5bc0d86c3c0179ab0f3e490c38f7974b43656c5a507516a8f598c466ec1c0cc"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4976.0.0-linux-x64.tar.gz"
    sha256 "16373614946aa9636c4af47430481abbb1cd4089ae75997ffa45334a922acfc1"
  end
  version "4976.0.0"
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
