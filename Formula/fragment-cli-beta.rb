require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5290.0.0-darwin-x64.tar.gz"
    sha256 "e4e50bc52e0f471affbbf2ffc521296944ae66cdf1df7601bc619216b2ca52cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5290.0.0-darwin-arm64.tar.gz"
      sha256 "08ad60f2a43bee5035149840da3514970c245584e60f5bf0add1c82747108a71"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5290.0.0-linux-x64.tar.gz"
    sha256 "1d5869c694a6e6432c54bcbc1570d31ba59c13fa4619037ebfb850f3f6b715c7"
  end
  version "5290.0.0"
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
