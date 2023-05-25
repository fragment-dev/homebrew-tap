require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.25-darwin-x64.tar.gz"
    sha256 "bb4623e6276f5a940c05a88b99dbe4de6ab9b8f79dc22429bac9f83212d4d522"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.25-darwin-arm64.tar.gz"
      sha256 "6dff6e69cf255819d825f1ef1110a456b7027ef78af4d47435a4e2b155fc8500"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.5.25-linux-x64.tar.gz"
    sha256 "9e0f0325b5646ef5d2f63fbd16a05a4ef5ff8d1c3e87077378e8d853edd4f447"
  end
  version "2023.5.25"
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
