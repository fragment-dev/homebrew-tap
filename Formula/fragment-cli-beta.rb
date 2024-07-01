require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5330.0.0-darwin-x64.tar.gz"
    sha256 "fde7be8703e0c40b5857176fc6ec2d1fea00388aad4c623863a937cf11c65432"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5330.0.0-darwin-arm64.tar.gz"
      sha256 "f435cbe7727a656da96f85194f604f66b9a295a3e36d92f319d815b5c0e8170f"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5330.0.0-linux-x64.tar.gz"
    sha256 "858a4180f7851078793dd508933364138754a036814cfc9752a6334d923d78f4"
  end
  version "5330.0.0"
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
