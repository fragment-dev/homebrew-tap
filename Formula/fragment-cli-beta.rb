require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5514.0.0-darwin-x64.tar.gz"
    sha256 "2a87d22f2fd1abe1e54e1457e8b64cc4d95010958d95ec462b3a8a6a7d8774a6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5514.0.0-darwin-arm64.tar.gz"
      sha256 "3cb41fceb0f09870d70584d466d58fdd5ae28083b8f2ce300b8524a4ae65b336"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5514.0.0-linux-x64.tar.gz"
    sha256 "78c35822f4c71def9f5c54e490e1394bd2b740a5c89ccae3546a5cb25201df6d"
  end
  version "5514.0.0"
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
