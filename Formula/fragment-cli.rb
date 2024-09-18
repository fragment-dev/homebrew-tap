require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.17-1-darwin-x64.tar.gz"
    sha256 "fd9ee25a934ab353770628b88c55f56955eab1332fff3be8b3fcbcc1a2839abb"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.17-1-darwin-arm64.tar.gz"
      sha256 "946f572453dacd796a5362779158bc03b7d8856954a67af38e291dc443156e1c"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2024.9.17-1-linux-x64.tar.gz"
    sha256 "6d0751e3137d7edb576a9b2e0f6f3b699f90ac1fc2b3b9cf327213f9c5293eea"
  end
  version "2024.9.17-1"
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
