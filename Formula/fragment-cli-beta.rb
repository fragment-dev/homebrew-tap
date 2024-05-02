require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4990.0.0-darwin-x64.tar.gz"
    sha256 "02f8cf4b6237696802f777d696965a360449572fbe1af2383325940ee9f3b0e5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4990.0.0-darwin-arm64.tar.gz"
      sha256 "7842a9cd66475f6097f6c3ea8d293dc6a958bc8c4163d5b76fe70e8ab8ea92f5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4990.0.0-linux-x64.tar.gz"
    sha256 "b3360c291529276f139f861166a4ec80468fa48197a19d3cab17b600abe01e13"
  end
  version "4990.0.0"
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
