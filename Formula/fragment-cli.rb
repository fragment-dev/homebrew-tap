require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.22-darwin-x64.tar.gz"
    sha256 "fb4c9bb87fadb578b91a0fb50ae6b6ed488600ea37f841f7836b9a062538ff4f"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.22-darwin-arm64.tar.gz"
      sha256 "7d22dbbef092dd3809579ebc1cbc4cb34292e905532005eb730ee0f95e4ded1f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.22-linux-x64.tar.gz"
    sha256 "a5fb3fbf05872c7f092ca7d1035b104fdd186afa51136c8a7aa53bbf82a68bf2"
  end
  version "2023.5.22"
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
