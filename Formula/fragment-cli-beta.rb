require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5095.0.0-darwin-x64.tar.gz"
    sha256 "ab849a3d4b1fe4e62f59a9199107993adbf69a9bd3e46d31d20c666deb4b09a9"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5095.0.0-darwin-arm64.tar.gz"
      sha256 "9aa7e5ad9bccbccd323526ccd1b560ae375abfe3aa1c96f76e9d39b56196b783"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5095.0.0-linux-x64.tar.gz"
    sha256 "350fcd6fb72ae49bc9afd18062c0d14173f959a7205d39c226eb0cdb6693af0f"
  end
  version "5095.0.0"
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
