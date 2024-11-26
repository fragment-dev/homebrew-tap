require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5832.0.0-darwin-x64.tar.gz"
    sha256 "cf9eea60746d0222ea3abaf85c3fea4147ba5b6c50afca938f85bab560983c8d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5832.0.0-darwin-arm64.tar.gz"
      sha256 "fc5c209fbb3f642dc0ec55d03c27428fc57eec09339ae37252d44d66d59ec189"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5832.0.0-linux-x64.tar.gz"
    sha256 "1ea8d7c494c5c61a51467cb90f4dc31b49dd235a5adf0802fd16f359f213b6ec"
  end
  version "5832.0.0"
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
