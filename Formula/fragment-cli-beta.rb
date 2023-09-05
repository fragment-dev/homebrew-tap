require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3482.0.0-darwin-x64.tar.gz"
    sha256 "824b93b7a0e107a08fc572425764992693ef195d1f6ff34d977f4babea18da32"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3482.0.0-darwin-arm64.tar.gz"
      sha256 "a74e6c48967bace7660955ebdfa833e2eb069000bcf4f785ba0d5fb29f51b590"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3482.0.0-linux-x64.tar.gz"
    sha256 "28ab2a56348ce871118deb940726173b54d7d3c717704a3ebb8bb7faa0b6b033"
  end
  version "3482.0.0"
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
