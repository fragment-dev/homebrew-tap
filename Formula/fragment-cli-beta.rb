require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2752.0.0-darwin-x64.tar.gz"
    sha256 "d1b012d6c93bb8d98197241a5b30acd710b886a63637b52bea568b2f06422f6d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2752.0.0-darwin-arm64.tar.gz"
      sha256 "84ecd45cbc8d3c2dc3b8b0d205aba9f778127c122c9d89d4d3c29bc369ffc416"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2752.0.0-linux-x64.tar.gz"
    sha256 "09949b4a45fdf323ecf6579488ec1fcbe492d31b21e3f134a4596628c721a20a"
  end
  version "2752.0.0"
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
