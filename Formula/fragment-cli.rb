require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.10-darwin-x64.tar.gz"
    sha256 "62e12779d38474af37e01d94ac510e6fff6c0be187ab7f753533cf22271dc3cf"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.10-darwin-arm64.tar.gz"
      sha256 "fb4b58b5e779c2c2941c28aa560629f0cf77320110b31e9fe431af85331431d6"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.12.10-linux-x64.tar.gz"
    sha256 "bbd018c4422676662becd766c203ea7363dc94815965aa527c9093090a980775"
  end
  version "2024.12.10"
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
