require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4336.0.0-darwin-x64.tar.gz"
    sha256 "fdd7c4947e561b63aaf1dc800413858a7464e2f50876bfb72597c75032d89e51"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4336.0.0-darwin-arm64.tar.gz"
      sha256 "2ad9ac2b5a1cdfc9be1d6ec2e3a6bc82b59e04fe125360cf23349251add86a12"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4336.0.0-linux-x64.tar.gz"
    sha256 "8ac9a5513a6345fcd60e192a82e28267e1c25bd3f2522ca25ac7c8d0b5e941df"
  end
  version "4336.0.0"
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
