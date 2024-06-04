require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5191.0.0-darwin-x64.tar.gz"
    sha256 "228b1d768ce6cdebd687df91cd5aa815d1b885ea33246d763c988189fc4334ea"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5191.0.0-darwin-arm64.tar.gz"
      sha256 "f0aaa2043bb8b239939b1992730972f096770c72437223a1fdc7d9b9a4b8e095"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5191.0.0-linux-x64.tar.gz"
    sha256 "aa3c849f1b498697405c773945b27f1d49079ba801d3a4e65eee4924bacb8ad1"
  end
  version "5191.0.0"
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
