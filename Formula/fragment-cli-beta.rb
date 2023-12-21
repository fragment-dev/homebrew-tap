require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4188.0.0-darwin-x64.tar.gz"
    sha256 "31a5c641287a93ef19580972c791bd5ae6c146a9813d99e58a1c0e393b2a9a06"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4188.0.0-darwin-arm64.tar.gz"
      sha256 "f5e299cf9f0d22a67eb52dc7a8d9c0421ca2532ad5005721b827992d01c996bb"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4188.0.0-linux-x64.tar.gz"
    sha256 "8587adfdbd06f16964c63a4b6db2701053e496caf8b6abef9d0c5a714ebca99d"
  end
  version "4188.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
