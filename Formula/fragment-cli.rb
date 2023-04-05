require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.5-darwin-x64.tar.gz"
    sha256 "3233acd63ba550b3688bc567c311d695f7ebd3a4bf5f42652ea04d1c9f698b68"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.5-darwin-arm64.tar.gz"
      sha256 "badb1b5fe37d5e429e89646e045cd7902e9d7c02efb086e3ad064c0df40b897c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.5-linux-x64.tar.gz"
    sha256 "bae8469224ab2bd3106cb272157ccc2a9a49678f4da84374a3bb5eb8c58236c2"
  end
  version "2023.4.5"
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
