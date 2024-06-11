require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-2-darwin-x64.tar.gz"
    sha256 "0222b3ebf537ccfcc927868e96d7fb697643b4cb7d1c1581d1a8a0499430fea7"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-2-darwin-arm64.tar.gz"
      sha256 "0c4eeaec79c6b5224767b07fc2d6f28e01683cc3502aaf70f30c4c5badf87222"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.6.10-2-linux-x64.tar.gz"
    sha256 "8a0af0f10d628c34749c7a269b9418b28ac023e594d36c3f40c4ca3458cd9182"
  end
  version "2024.6.10-2"
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
