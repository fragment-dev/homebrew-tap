require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.15-darwin-x64.tar.gz"
    sha256 "696a6e85982486d5fc3f0732020a73260c1b5aa0f676eefc457d0d31a2582088"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.15-darwin-arm64.tar.gz"
      sha256 "a3296124848c7af5fe7513f447de1ce644ea9a988ddbe677bae3282e9977d35f"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.9.15-linux-x64.tar.gz"
    sha256 "44847ceb670b14fda338be44f8f6326391625fa0f9313e871a700d9e1968bb38"
  end
  version "2023.9.15"
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
