require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2546.0.0-darwin-x64.tar.gz"
    sha256 "23266f072820685ec40cccde9d26f1e26bb7c98e85b1832edacbbaa010d3bef1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2546.0.0-darwin-arm64.tar.gz"
      sha256 "e8dbefbf3db359bc0feeccbf9f6ecbdaaf5b799dbab245988136f68e9461b7ea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2546.0.0-linux-x64.tar.gz"
    sha256 "6e0d63f24e053ee21f6e1c939d3992c4545b15942533458aaf445f13e2989a0a"
  end
  version "2546.0.0"
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
