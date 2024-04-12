require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4878.0.0-darwin-x64.tar.gz"
    sha256 "164728847b52210bf38788bcc12028e8b2bbe764b69e4f8c9d35d9485b15505f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4878.0.0-darwin-arm64.tar.gz"
      sha256 "ccae50ec2221e457ac93c43b6c49e9d09407d0267a40bc939a51150fcf414c1e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4878.0.0-linux-x64.tar.gz"
    sha256 "373862b34bf11b8909d4bad162a1bf3fa1d26d969c514329b76078a023126637"
  end
  version "4878.0.0"
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
