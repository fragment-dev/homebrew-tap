require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2662.0.0-darwin-x64.tar.gz"
    sha256 "555a540bf22ff9c9ac22bf6c7a4272d1b4f93610e7c28e6376285825e0511c6e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2662.0.0-darwin-arm64.tar.gz"
      sha256 "1399e4eaae72791445b3bd86e85f522bf34faaa5307da28c41ddb622fac88f1c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2662.0.0-linux-x64.tar.gz"
    sha256 "50d203613e8bb2554c8e81e37221fae779c96fd56723e09a264c1d31b855e24c"
  end
  version "2662.0.0"
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
