require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5816.0.0-darwin-x64.tar.gz"
    sha256 "f14f0448eaac03c67d7baacba6bc83c9b61ae241f3f6532cbfff31c7c4d6c39f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5816.0.0-darwin-arm64.tar.gz"
      sha256 "0a05cc8a1e37eb65047ae888fae0e75c6a4a87080295259a6016104e9ea0f1e9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5816.0.0-linux-x64.tar.gz"
    sha256 "337337036b61b735a18e200d7ba2244580db41de2694fedede8e5fa24bc10f51"
  end
  version "5816.0.0"
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
