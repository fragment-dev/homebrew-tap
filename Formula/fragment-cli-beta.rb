require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5341.0.0-darwin-x64.tar.gz"
    sha256 "bf7a394612f1039f58af6476bfab5f4bf318eb93a095cfd0a33571d3d77d4d04"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5341.0.0-darwin-arm64.tar.gz"
      sha256 "3e51b785d929a62a6de859f939c2abe00f0489479c34c4bd557d802b01bf1729"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5341.0.0-linux-x64.tar.gz"
    sha256 "4742f4ee17f06f54103f610d1bb1d02dd416345770a652919c2c1e99f95e555c"
  end
  version "5341.0.0"
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
