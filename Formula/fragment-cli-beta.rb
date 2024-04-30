require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4970.0.0-darwin-x64.tar.gz"
    sha256 "52a027fc2d9834fc4656e21287eb2b60f620952ff8addd976a8760947ac65a52"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4970.0.0-darwin-arm64.tar.gz"
      sha256 "a572d8e9b00f4f1ccde60e836290482601308375ba575c69856e04fcdafcfa10"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4970.0.0-linux-x64.tar.gz"
    sha256 "15163bdf65b2068f7e761e4e51d55de896249738c089b8df96e69d0ca4f6e9e4"
  end
  version "4970.0.0"
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
