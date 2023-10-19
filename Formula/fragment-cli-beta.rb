require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3868.0.0-darwin-x64.tar.gz"
    sha256 "cd55e69b430b36e4939e1bc43ba12c39bc5445e8da0d73ba8b16e0b62221ccfa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3868.0.0-darwin-arm64.tar.gz"
      sha256 "2480fba1bb3842641f80920c918fbad62007dd7b4eea674c0f0ed5cf120e7c5c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3868.0.0-linux-x64.tar.gz"
    sha256 "e7ee12112c44ccebc620cf7186f37f4833db897af75262e591af7cddf1a135de"
  end
  version "3868.0.0"
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
