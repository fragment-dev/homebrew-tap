require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3214.0.0-darwin-x64.tar.gz"
    sha256 "4d7ef69aebb570d7ef043ba45024edb2354b08cef2cd25ac003254135708e99b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3214.0.0-darwin-arm64.tar.gz"
      sha256 "a3f3b5cf15ef4a4539ff6367bbb1de9e6dde5ebf84d4d70ab3c63fdaf02f23eb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3214.0.0-linux-x64.tar.gz"
    sha256 "5c689b8fed195173633507e1ea0e8456ab8f8e2e49bbcb76a6d621010671e639"
  end
  version "3214.0.0"
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
