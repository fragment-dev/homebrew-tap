require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4148.0.0-darwin-x64.tar.gz"
    sha256 "5cc953f1c8c32bb351a891be8f4d67eed85cfad175b373627851e5a3764b142f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4148.0.0-darwin-arm64.tar.gz"
      sha256 "399eb6db3b028bdda2e27974aa57bcc589c303bd17a89f92bb3e618c91ccefd3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4148.0.0-linux-x64.tar.gz"
    sha256 "2c4c08666a647a8d0cbc20f6d9b6a7230d1bc215df8746e5b67473ea71d9f57f"
  end
  version "4148.0.0"
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
