require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2285.0.0-darwin-x64.tar.gz"
    sha256 "2410b1358277dbe8634fc26a15f789604c3caac44869985bc04eb60756b96ab9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2285.0.0-darwin-arm64.tar.gz"
      sha256 "970c6e2f1fafd46cecb0a2ebb43d628eb3a9de8b120e55f63a5244cd1bb7c9ea"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2285.0.0-linux-x64.tar.gz"
    sha256 "f155ad89017c62f9c477c12225d44b27a72a0e713e4a4edac85403af96713fb9"
  end
  version "2285.0.0"
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
