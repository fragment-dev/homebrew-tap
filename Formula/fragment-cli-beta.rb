require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5050.0.0-darwin-x64.tar.gz"
    sha256 "0f4efbaa1d6d70f0527a35ca8ce7f61671e454b56d06914314da0c7fca18c5f6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5050.0.0-darwin-arm64.tar.gz"
      sha256 "6ddbc99f8e32d73aad8f292efba95be7e6fe2d1ab9192e43d4474521b36d15b0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5050.0.0-linux-x64.tar.gz"
    sha256 "bc526a051b87c23d168465bd78beb88f85033405a0a13c28b68152fd610679fe"
  end
  version "5050.0.0"
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
