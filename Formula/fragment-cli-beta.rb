require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3781.0.0-darwin-x64.tar.gz"
    sha256 "20320a58882af0a35c9efbc47ca8296bcbacb488f60e986ab1cf64bcf8f5cd9e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3781.0.0-darwin-arm64.tar.gz"
      sha256 "5f706f8cc09c3e20c4ae238fda10c5cb175fa47b4f893f422ce32af5b4668f31"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3781.0.0-linux-x64.tar.gz"
    sha256 "cd844f89772ef9ecdbcdae7b7584d3be5981c8a3113f3685264d4b576e2139c1"
  end
  version "3781.0.0"
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
