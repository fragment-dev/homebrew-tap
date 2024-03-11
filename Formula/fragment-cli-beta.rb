require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4747.0.0-darwin-x64.tar.gz"
    sha256 "dd8f321cccc88013894a441db4a2191bfff48da12388992d5b718eb633b39976"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4747.0.0-darwin-arm64.tar.gz"
      sha256 "f8f32aa6ded63aa3a8b7a818520dbb933a7d51a0e38ce386afbf266b23ca2f1b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4747.0.0-linux-x64.tar.gz"
    sha256 "b064aed63471b73247fcf233863d50afb99bc4eda5277c193e5e6e3359c69292"
  end
  version "4747.0.0"
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
