require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3699.0.0-darwin-x64.tar.gz"
    sha256 "6bb55feb584f4975e6571d5ee93094b95e0dec01516627152fcca895387f18b0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3699.0.0-darwin-arm64.tar.gz"
      sha256 "1f703ef24a64b6a9408a8e2b8008f68394dda511a18cd3af13516f37eed0043f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3699.0.0-linux-x64.tar.gz"
    sha256 "d3e5f485a5259490aab9d3ba257003a32367c1b34b608366c6fed871a2f46038"
  end
  version "3699.0.0"
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
