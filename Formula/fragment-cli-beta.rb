require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4545.0.0-darwin-x64.tar.gz"
    sha256 "160a04b279cb08a4bd9f249fd2a8475217257c0aedeacef646b4cde5e15edcf6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4545.0.0-darwin-arm64.tar.gz"
      sha256 "d01a16ed54e12f257338a707ecdbfc9b913d501ba055f09d00a85a82296fc242"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4545.0.0-linux-x64.tar.gz"
    sha256 "5c2fa2756195e6c4c6d70f3dccdca495f8fa27d4a027d75ccbc8fc2c101f2221"
  end
  version "4545.0.0"
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
