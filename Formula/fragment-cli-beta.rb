require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5486.0.0-darwin-x64.tar.gz"
    sha256 "1d7eb19e226da275146e2d212b95952f159d19e35ff12c9a7660881e5f798ed2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5486.0.0-darwin-arm64.tar.gz"
      sha256 "054cb0c0f6670c02091abccf2c773951c2ab73460ff53cd5e141598cd7bb67dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5486.0.0-linux-x64.tar.gz"
    sha256 "44338d6df51e2a294cf87b3a464f8e177e8dbbb65f356ed065b7cb5c14882c16"
  end
  version "5486.0.0"
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
