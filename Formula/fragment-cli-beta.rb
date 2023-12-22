require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4208.0.0-darwin-x64.tar.gz"
    sha256 "a388c4c4819f219bd5d32f32868c491b10b44e2c18f04ee364a8aa608861e8c3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4208.0.0-darwin-arm64.tar.gz"
      sha256 "c5992fbbe4715a31bc830a42dfed8824871f4fc40f817b75748489aa2d467e15"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4208.0.0-linux-x64.tar.gz"
    sha256 "2e286a1a0ba06cfaec1dfc7c0c8b4f7137a4f9f7d8bb65042bd0a140714ad982"
  end
  version "4208.0.0"
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
