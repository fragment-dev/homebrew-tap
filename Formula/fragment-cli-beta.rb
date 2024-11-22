require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5823.0.0-darwin-x64.tar.gz"
    sha256 "71f3b0c17af36e93b34ef10d7c9baae3a9846b12094cc74c6966a5a2b5393c24"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5823.0.0-darwin-arm64.tar.gz"
      sha256 "7ef5914664b63cc5ddd078f745baa87fa5e399dc5c4deccffa1818edf0938974"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5823.0.0-linux-x64.tar.gz"
    sha256 "5fbcdd7ee051b5cea5f96a57b2507ee41a105b57fa6eac4a1e6d47127dece7b5"
  end
  version "5823.0.0"
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
