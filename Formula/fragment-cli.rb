require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.15-1-darwin-x64.tar.gz"
    sha256 "ddbdf4e9ba44bc7fb4a911bbb44d804cd18e15edd4e606dfac87d6e0a9598232"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.15-1-darwin-arm64.tar.gz"
      sha256 "4d68be38aa34b56aeab6b353a73c723dc0222df5107e6b8225c3abcc6960ed71"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.15-1-linux-x64.tar.gz"
    sha256 "3dccd5dd76023ed35337c5ef1627d05223ef77cc2588599b268a5358991458b1"
  end
  version "2023.9.15-1"
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
