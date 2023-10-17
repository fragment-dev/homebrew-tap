require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3849.0.0-darwin-x64.tar.gz"
    sha256 "de0f1fb5a7e6b8556f0f37db21ff23318c72277a90f21375a36bc103c31f45e3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3849.0.0-darwin-arm64.tar.gz"
      sha256 "c3d96992be2d0f808515478ec2d7a18ec2e8921a398488866f46a58a53f4a929"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3849.0.0-linux-x64.tar.gz"
    sha256 "69a65de110aca449130518dfd3bbbbe9f49d98632bac7897d43e99da71010527"
  end
  version "3849.0.0"
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
