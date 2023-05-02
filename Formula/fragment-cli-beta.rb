require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2568.0.0-darwin-x64.tar.gz"
    sha256 "72772eb17bf8c25b0eda854c48c712356779763c808ab41787ad3ce5f12a62d9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2568.0.0-darwin-arm64.tar.gz"
      sha256 "e2352f3f885b2e8a4eedb56b2d34228969ee4ab0a02f8857cd204b0bdeeb722f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2568.0.0-linux-x64.tar.gz"
    sha256 "1c52d779e196b8e5192674c852f73e369b88882fee7bf9a7c1a649ea034ee4b0"
  end
  version "2568.0.0"
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
