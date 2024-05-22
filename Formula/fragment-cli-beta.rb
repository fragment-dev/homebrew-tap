require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5104.0.0-darwin-x64.tar.gz"
    sha256 "7e59ad003ac97e63816c80f3d02c76aeb1ca6143a48a1c6464a311ad64c3793e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5104.0.0-darwin-arm64.tar.gz"
      sha256 "da9d60e339844719c06ac4b93a53ceb845bee872338e82a2267237669262df0e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5104.0.0-linux-x64.tar.gz"
    sha256 "9ecccf337559a60276e2017f9dff0699a84bcba5af75fb8f6df81e415413162a"
  end
  version "5104.0.0"
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
