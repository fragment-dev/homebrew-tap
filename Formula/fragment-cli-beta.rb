require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2555.0.0-darwin-x64.tar.gz"
    sha256 "964f45e92de422f50b35d20457ffa9e040711ac095314a47ef8690eeae9d5547"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2555.0.0-darwin-arm64.tar.gz"
      sha256 "1fc9dd541f6bbe2693295aeed92f32f4cdf3ead0172de296fb1ea3f9e1662da0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2555.0.0-linux-x64.tar.gz"
    sha256 "f56dd6fe99b0618dcae4deec81b3d154ab20dfb82d757172e99e7a26024c92e1"
  end
  version "2555.0.0"
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
