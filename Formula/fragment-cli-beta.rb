require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4217.0.0-darwin-x64.tar.gz"
    sha256 "e1c77e5e2de667d02e73c909d3b769728f486b71ba39602eab8f57a0c9233335"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4217.0.0-darwin-arm64.tar.gz"
      sha256 "999434ebcaed73e86b7147b31032e54292f0cac10d64f3f7aa536f54dfd58b18"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4217.0.0-linux-x64.tar.gz"
    sha256 "ba2984cb1ac96a8a27c0534b80cb04716df6963f9bfde0f8a04b52ebd63b120c"
  end
  version "4217.0.0"
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
