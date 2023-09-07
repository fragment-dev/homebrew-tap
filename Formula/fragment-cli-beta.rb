require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3498.0.0-darwin-x64.tar.gz"
    sha256 "89c75d7d2a57b9845a5c13424297891d91aef0debfabf7c5d8f22d697a495be8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3498.0.0-darwin-arm64.tar.gz"
      sha256 "ed81022b66250f04c7f80b63e3734d21785dfa81a116da0ba5bb513470529b9f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3498.0.0-linux-x64.tar.gz"
    sha256 "8c7030a39848af5f4084a8594394442d29672b107c9a770713eb285ce2318563"
  end
  version "3498.0.0"
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
